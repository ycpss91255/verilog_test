module divisor (
    input	 iClk,
    input	 iRst_n,
    output	reg oClk
  );
  reg   [24:0]  counter;

  always @(posedge iClk or negedge iRst_n)
  begin
    if (!iRst_n)
    begin
      counter <= 25'h0;
      oClk <= 1'b0;
    end
    else
    begin
      if(counter < 62500)
      begin	            //1 Hz除頻器
        counter  <= counter  +1;		//加法器
        oClk <= oClk ;	//閂鎖器
      end
      else
      begin
        counter  <= 0;
        oClk <= ~oClk ;	//經過not 邏輯閘進行反向
      end
    end
  end
endmodule
