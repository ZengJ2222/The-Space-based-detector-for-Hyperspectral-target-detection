function Output = R_SA2(HIM, d)
% R-SA2
% input 
%  HIM: imagecube,row*col*band
%  d: desired target,L*1
display('start R-SA2 algorithm');
[row,col,bnd] = size(HIM);
newHIM = reshape(HIM,row*col,[]);% r: L*N
R = newHIM'*newHIM/(row*col);
IR = pinv(R);
delta1 =(d'*IR*(newHIM'))'*(d'*IR*(newHIM'));
delta2 =((d'*IR*d).*(newHIM*IR*(newHIM')));
delta=diag(delta1./delta2);
Output = reshape(delta,row,col);
display('R-SA2 algorithm done');
end