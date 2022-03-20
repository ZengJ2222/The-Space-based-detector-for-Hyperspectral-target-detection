function Output = AMD(HIM, d)
% AMD
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start ADM algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta =(d-u)'*IK*(newHIM'-repmat(u,1,row*col));
Output = reshape(delta,row,col);
display('ADM algorithm done');
end