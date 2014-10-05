module ext_code_32ch_8p
(
    iSET_CODE_FLAG,
    iSET_CODE,
    iSET_INDEX_FLAG,
    iSET_INDEX,
    iRst,
    iTrigger,
    iClk,
    oCode
);
input                               iRst;
input                               iClk;
input                               iSET_CODE_FLAG;
input           [31:0]              iSET_CODE;
input                               iSET_INDEX_FLAG;
input           [7:0]               iSET_INDEX;

input                               iTrigger;
output  reg     [31:0]              oCode;
reg             [31:0]              oCode_next;

reg             [7:0]               index,index_next;
reg             [31:0]              storge[7:0];



always @ (posedge iTrigger or posedge iSET_INDEX_FLAG)
begin
    if(iSET_INDEX_FLAG)
    begin
        index_next = iSET_INDEX;
    end
    else
    begin
        index_next = index -1; //iTrigger
    end
end

always @ (posedge iRst or negedge iTrigger negedge iSET_INDEX_FLAG)
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
        oCode <= storge[index];
    end
    else
    begin
        oCode <= 0;
    end
end

always @ (posedge iSET_CODE_FLAG)
begin
    storge[index]<=iSET_CODE;
end


endmodule
