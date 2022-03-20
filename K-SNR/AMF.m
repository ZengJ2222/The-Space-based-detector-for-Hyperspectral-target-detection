function Output = AMF(HIM, d)
% AMF=GK-SNR=GLRT
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start AMF algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =diag((d'*IK*(newHIM'))'*(d'*IK*(newHIM')));
delta2 =d'*IK*d;
delta=delta1./delta2;
Output = reshape(delta,row,col);
display('AMF algorithm done');
end