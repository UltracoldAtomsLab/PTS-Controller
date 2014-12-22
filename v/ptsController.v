module ptsController
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

parameter MAX_PLUSE_NUM = 256; //MAX_PLUSE_NUM <= 256
parameter PTS_CH_BYTE_NUM = 4;  

input                                               iRst;
input                                               iClk;
input                                               iSET_CODE_FLAG;
input           [8*PTS_CH_BYTE_NUM-1:0]             iSET_CODE;
input                                               iSET_INDEX_FLAG;
input           [7:0]                               iSET_INDEX;

input                                               iTrigger;
output          [8*PTS_CH_BYTE_NUM-1:0]             oCode;
output          [7:0]                               debug_index;
output          [8*PTS_CH_BYTE_NUM-1:0]             debug_current_storge;

reg             [7:0]                               index,index_next;
reg             [8*PTS_CH_BYTE_NUM-1:0]             storge[MAX_PLUSE_NUM-1:0];


wire                                                change_index;

assign change_index = (iTrigger || iSET_INDEX_FLAG);


always @ (posedge change_index)
begin
    if(iSET_INDEX_FLAG == 1'b1)
    begin
        index_next = iSET_INDEX; 
    end
    else
    begin 
        index_next = index + 1'b1; 
    end
end

always @ (negedge change_index)
begin
    index <= index_next;
end


always @ (posedge iSET_CODE_FLAG)
begin
    storge[index] <= iSET_CODE;
end


assign oCode = storge[index];

//for debug usage
assign debug_index = index;
assign debug_current_storge = storge[index];

endmodule
