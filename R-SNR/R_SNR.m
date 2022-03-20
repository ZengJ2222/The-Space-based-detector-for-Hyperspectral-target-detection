function Output = R_SNR(HIM, d)
% R_SNR
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start R_SNR algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
R = newHIM'*newHIM/(row*col);
IR = pinv(R);
delta =d'*IR*(newHIM');
Output = reshape(delta,row,col);
display('R_SNR algorithm done');
end