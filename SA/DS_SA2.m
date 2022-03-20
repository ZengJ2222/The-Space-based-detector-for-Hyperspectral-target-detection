function Output = DS_SA2(HIM, d)
% DS_SA2
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start DS_SA2 algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =((d-u)'*IK*(newHIM'-repmat(u,1,row*col)))'*((d-u)'*IK*(newHIM'-repmat(u,1,row*col)));
delta2 =(((d-u)'*IK*(d-u)).*((newHIM'-repmat(u,1,row*col))'*IK*(newHIM'-repmat(u,1,row*col))));
delta=diag(delta1./delta2);
Output = reshape(delta,row,col);
display('DS_SA2 algorithm done');
end