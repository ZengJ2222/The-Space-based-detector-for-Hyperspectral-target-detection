function Output = OSP(HIM, d,b_class)
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
%  b_class:kinds of background
display('start OSP algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,bnd)';% r: L*N
U=b_class';
I=eye(size(U,1));
P=I-U*inv(U'*U)*U';
delta=d'*P*newHIM;
Output = reshape(delta',row,col);
display('OSP algorithm done');
end