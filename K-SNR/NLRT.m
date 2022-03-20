function Output = NLRT(HIM, d)
% NLRT
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start NLRT algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta1 =d'*IK*(newHIM');
delta2 =d'*IK*d;
delta=delta1./delta2;
Output = reshape(delta,row,col);
display('NLRT algorithm done');
end