module decoder
(
    iRst,
    imData,
    imData_Ready,
    oCode,
    oCode_Ready,
    oIndex,
    oIndex_Ready
);


// ==== I/O, Reg, Wire Declaration ======================================
input       [7:0]               imData;
input                           imData_Ready;
input                           iRst;


output      [31:0]              oCode;
output                          oCode_Ready;
output      [7:0]               oIndex;
output                          oIndex_Ready;                

reg         [7:0]               state,state_next;
reg         [7:0]               substate,substate_next;                

reg         [7:0]               Code    [3:0];
reg                             Code_Ready;
reg         [7:0]               Index;
reg                             Index_Ready;

parameter                       M_IDLE          =   8'd0;
parameter                       M_SET_CODE      =   8'd1;
parameter                       M_SET_INDEX     =   8'd2;
// ==== Structural Design ==============================


assign oCode[7:0]       = Code[0][7:0];
assign oCode[15:8]      = Code[1][7:0];
assign oCode[23:16]     = Code[2][7:0];
assign oCode[31:24]     = Code[3][7:0];

assign oCode_Ready      = Code_Ready;
assign oIndex           = Index;
assign oIndex_Ready     = Index_Ready;



always @ (posedge iRst or negedge imData_Ready)
begin
    if(iRst)
    begin
        state       <= M_IDLE;
        substate    <= 8'd0;
    end
    else
    begin
        state       <= state_next;
        substate    <= substate_next;
    end
end


//state logic
always @ (posedge imData_Ready)
begin
    case(state)
        M_IDLE:
        begin
            case(imData)
                M_SET_CODE:     state_next = M_SET_CODE;
                M_SET_INDEX:    state_next = M_SET_INDEX;
                default:        state_next = M_IDLE;
            endcase
            substate_next = 0;
        end
        
        M_SET_CODE:
        begin
            case(substate)
                8'd3:
                begin
                    substate_next = 0;
                    state_next = M_IDLE;                
                end
                default:
                begin
                    state_next = M_SET_CODE;
                    substate_next = substate + 1;
                end
            endcase
        end
        
        M_SET_INDEX:
        begin
            state_next = M_IDLE;
            substate_next = 0;
        end

        default:
        begin
            state_next = M_IDLE;
            substate_next = 0;
        end
        
    endcase
end

        
//output logic
always @ (*)
begin
    case(state)
        M_IDLE:
        begin
            Code_Ready = 0;
            Index_Ready = 0;
        end
        M_SET_CODE:
        begin
            Code[substate][7:0] = imData;
            Index_Ready = 0;
            case(substate)
                8'd3:
                begin
                    if(imData_Ready)//pass the ready flag
                        Code_Ready = 1;
                    else
                        Code_Ready = 0;
                end
                default:    Code_Ready = 0;
            endcase
        end
        M_SET_INDEX:
        begin
            Code_Ready = 0;
            Index[7:0] = imData;
            if(imData_Ready)
                Index_Ready = 1;
            else
                Index_Ready = 0;
        end
        default:
        begin
            Code_Ready = 0;
            Index_Ready = 0;
        end
   endcase
end

endmodule
