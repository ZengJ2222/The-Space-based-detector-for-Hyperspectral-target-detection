function Output = NGDS_SNR(HIM, d)
% NGDS-SNR=(NAMD)^2
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start NGDS_SNR algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =diag(((d-u)'*IK*(newHIM'-repmat(u,1,row*col)))'*((d-u)'*IK*(newHIM'-repmat(u,1,row*col))));
delta2 =((d-u)'*IK*(d-u))^2;
delta=delta1./delta2;
Output = reshape(delta,row,col);
display('NGDS_SNR algorithm done');
end