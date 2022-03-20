function Output = NOSP_GK_GLRT(HIM, d,b_class)
% OSP_GLRT
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
%  b_class:kinds of background
display('start NOSP_GK_GLRT algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,bnd);% r: L*N
U=b_class';
I=eye(size(U,1));
P=I-U*inv(U'*U)*U';
u=mean(newHIM)';
rr=P*newHIM';
dd=P*d;
uu=P*u;
K=((rr-repmat(uu,1,row*col))*(rr-repmat(uu,1,row*col))')./(row*col);
IK=pinv(K);
ru=P*(newHIM'-repmat(u,1,row*col));
delta1 = diag((dd'*IK*(ru))'*(dd'*IK*(ru)));
delta2 = (dd'*IK*dd)^2;
delta=delta1./delta2;
Output = reshape(delta',row,col);
display('NOSP_GK_GLRT algorithm done');
end