module ext_code_32ch_8p
(
    iSET_FLAG,
    iSET_DATA,
    iRst,
    iTrigger,
    iClk,
    oCode
);
input                               iRst;
input                               iClk;
input                               iSET_FLAG;
input           [31:0]              iSET_DATA;
input                               iTrigger;
output  reg     [31:0]              oCode;
reg             [31:0]              oCode_next;

reg             [7:0]               index,index_next;
reg             [31:0]              storge[7:0];


always @ (posedge iSET_FLAG or posedge iTrigger)
begin
    if(iSET_FLAG)
    begin
        storge[index] = iSET_DATA;
        index_next = index +1;
    end
    else
    begin
        index_next = index -1; //iTrigger
    end
end

always @ (posedge iRst or negedge iTrigger or negedge iSET_DATA)
begin
    if(iRst)
    begin
        oCode <= 0;
        index <= 0;
    end
    else
    begin
        oCode <= oCode_next;
        index <= index_next;
    end
end


always @ (*)
begin
    if(iTrigger)
    begin
        oCode <= storge[index-1];
    end
    else
    begin
        oCode <= 0;
    end
end

endmodule