function temp=LSOSP(image,d,U)
%% Code Comments:
% Least Square Orthogonal Subspace Projection
% input: image = image cube
% d = desire signature vector
% U = undesired signature matrix
% output: temp = resulting image cube
%

%% Authors Comments
%	Algorithm name: orthogonal subspace projection (OSP)
%	Authors: J.C. Harsanyi and Chein-I Chang
%	Category: spectrally matched filter
%	Designed Criteria: SNR ratio
%	Designed Method: A priori, supervised and unconstrained least squares-based linear spectral mixture analysis
%	Typical use (LOI's addressed): detection, classification, discrimination, identification
%	Inputs: reflectance or radiance cube, complete target knowledge
%	Outputs: gray-scale abundance fractional images
%	Assumptions: complete prior target knowledge required
%	Sensitivity to LOI (target knowledge): high
%	Sensitivity to noise: moderate
%	Operating bands: VNIR through LWIR
%	Maturity: mature/operational
%	Effectiveness: high
%	Implementation: simple, easy to use, real Time
%	Brief description:
%		The OSP approach was first developed in Harsanyi's Ph.D. dissertation in 1993 (Harsanyi, 1993)
%		and was later published in IEEE Transaction on Geoscinece and Remote Sensing, July 1994
%		(Harsanyi and Chang, 1994). It is a linear unmixng method that takes advantage of a linear mixture
%		model to detect, classify, and identify targets of interest. The idea is to separate target sources
%		into desired and undesired targets and then use an orthogonal project to reject the desired
%		targets before a matched filtration takes place. So, it operates two functions in sequence: an
%		undesired target rejecter followed by a spectral matched filtration. Since OSP was originally
%		designed as a detector and cannot accurately estimate signature abundance fractions, a least
%		squares version of OSP, referred to as least squares OSP (LSOSP) was further developed in
%		Chang et al. (1998b) for abundance fraction estimation. The only difference between OSP and
%		LSOSP is that LSOSP includes a normalization constant to account for estimation error incurred
%		in the OSP-derived detector (Chang, 2009). So, the MATLAB codes provided in the following is
%		a more general version of OSP, LSOSP

%% Code

[x, y, z]=size(image);
temp = zeros(x,y);
%Find the projectors that is orthogonal complement of U
[l,~] = size(U);
I = eye(l,l);
Pu=I-U*inv(U'*U)*U';
lsosp = (d'*Pu)/(d'*Pu*d);
% perform least-squares-based estimator on all image vectors
for i = 1:x
    for j = 1:y
        for k = 1:z
            r(k) = image(i,j,k);
        end
        temp(i,j)=lsosp*r';
    end
end
