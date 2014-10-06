module ext_code_32ch_8p
(
    iSET_CODE_FLAG,
    iSET_CODE,
    iSET_INDEX_FLAG,
    iSET_INDEX,
    iRst,
    iTrigger,
    iClk,
    oCode,
    debug_index,
    debug_current_storge
);
input                               iRst;
input                               iClk;
input                               iSET_CODE_FLAG;
input           [31:0]              iSET_CODE;
input                               iSET_INDEX_FLAG;
input           [7:0]               iSET_INDEX;

input                               iTrigger;
output          [31:0]              oCode;
output          [7:0]               debug_index;
output          [31:0]              debug_current_storge;


reg             [31:0]              Code;

reg             [7:0]               index,index_next;
reg             [31:0]              storge[7:0];



always @ (posedge iRst or posedge iTrigger or posedge iSET_INDEX_FLAG)
begin
    if (iRst)
    begin
        index_next = 0;
    end
    else
        begin
        if(iSET_INDEX_FLAG)
        begin
            index_next = iSET_INDEX;
        end
        else
        begin
            index_next = index - 1; //iTrigger
        end
    end
end

always @ (negedge iRst or negedge iTrigger or negedge iSET_INDEX_FLAG)
begin
    begin
        index <= index_next;
    end
end


always @ (*)
begin
    if(iTrigger)
    begin
        Code <= storge[index];
    end
    else
    begin
        Code <= 32'd0;
    end
end

always @ (posedge iSET_CODE_FLAG)
begin
    storge[index]<=iSET_CODE;
end


assign oCode = Code;


//for debug usage
assign debug_index = index;
assign debug_current_storge = storge[index];

endmodule
