function Output = NMF(HIM, d)
% NMF=K_SA
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start NMF algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,bnd);% r: L*N
R = newHIM'*newHIM/(row*col);
IR = pinv(R);
delta1 = d'*IR*(newHIM');
part1=sqrt(d'*IR*d);
for i=1:row*col
    part2(i)=newHIM(i,:)*IR*(newHIM(i,:)');
end
% [U S V]=svd(newHIM*IR*(newHIM'));
% S1=diag(sqrt(diag(S)));
% part2=U*S1*V';
delta2 = part1.*part2;
delta=delta1./delta2;
Output = reshape(delta',row,col);
display('NMF algorithm done');
end