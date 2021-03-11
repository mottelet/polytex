psbook %1.ps temp1
psnup -2 temp1 temp2  
pstops 2:0@1,1@1U(21cm,29.7cm) temp2 %1.booklet.ps
@del temp1
@del temp2
