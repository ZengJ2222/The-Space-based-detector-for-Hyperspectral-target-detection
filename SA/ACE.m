function Output = ACE(HIM, d)
% ACE=K-SA2
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start ACE algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =((d-u)'*IK*(newHIM'-repmat(u,1,row*col)))'*((d-u)'*IK*(newHIM'-repmat(u,1,row*col)));
delta2 =(((d-u)'*IK*(d-u)).*((newHIM'-repmat(u,1,row*col))'*IK*(newHIM'-repmat(u,1,row*col))));
delta=diag(delta1./delta2);
Output = reshape(delta,row,col);
display('ACE algorithm done');
end