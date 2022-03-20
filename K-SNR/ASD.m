function Output = ASD(HIM, d)
% ASD=NGK-SNR=(NLRT)^2
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start ASD algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =diag((d'*IK*(newHIM'))'*(d'*IK*(newHIM')));
delta2 =(d'*IK*d)^2;
delta=delta1./delta2;
Output = reshape(delta,row,col);
display('ASD algorithm done');
end