function Output = NGR_SNR(HIM, d)
% NGR-SNR=(CEM)^2
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start NGR_SNR algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,bnd);% r: L*N
R = newHIM'*newHIM/(row*col);
IR = pinv(R);
delta1 = diag((d'*IR*(newHIM'))'*(d'*IR*(newHIM')));
delta2 = (d'*IR*d)^2;
delta=delta1./delta2;
Output = reshape(delta',row,col);
display('NGR_SNR algorithm done');
end