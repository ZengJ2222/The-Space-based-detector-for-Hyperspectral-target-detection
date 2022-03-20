function Output = LRT(HIM, d)
% LRT
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start LRT algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
u=mean(newHIM)';
IK=pinv(cov(newHIM));
delta =d'*IK*(newHIM');
Output = reshape(delta,row,col);
display('LRT algorithm done');
end