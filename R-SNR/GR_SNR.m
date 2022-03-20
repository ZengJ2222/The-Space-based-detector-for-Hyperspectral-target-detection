function Output = GR_SNR(HIM, d)
% GR-SNR
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start GR_SNR algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,bnd);% r: L*N
R = newHIM'*newHIM/(row*col);
IR = pinv(R);
delta1 = diag((d'*IR*(newHIM'))'*(d'*IR*(newHIM')));
delta2 = d'*IR*d;
delta=delta1./delta2;
Output = reshape(delta',row,col);
display('GR_SNR algorithm done');
end