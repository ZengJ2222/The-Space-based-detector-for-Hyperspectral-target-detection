function Output = GDS_SNR(HIM, d)
% GDS-SNR
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start GDS_SNR algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =diag(((d-u)'*IK*(newHIM'-repmat(u,1,row*col)))'*((d-u)'*IK*(newHIM'-repmat(u,1,row*col))));
delta2 =(d-u)'*IK*(d-u);
delta=delta1./delta2;
Output = reshape(delta,row,col);
display('GDS_SNR algorithm done');
end