function con = consistency(p,e)
%Computes the consistency when comparing a detected edge (e) with a
%projected edge (p). 
%
%Inputs: p should be -1, 0 or 1 and e should be between -1 and 1
%Output: a consistency value (see reference below)
% 
%Created by: Jaco Verster (versterrie@gmail.com)
%
%Reference: Zhang L, Curless B, Seitz SM. Rapid shape acquisition using
%color structured light and multi-pass dynamic programming. In: The first
%IEEE international symposium on 3D data processing, visualization, and
%transmission; 2002. p.

%alpha and beta are user-defined soft-thresholds used in the score function 
alpha = 0.01; beta = 0.1; 

if p == 1
    a = (e - alpha)/(beta - alpha); 
elseif p == 0
    a = 1 - (abs(e) - alpha)/(beta - alpha); 
elseif p == -1
    a = (-e - alpha)/(beta - alpha);  
else
    disp('Error, p should be either -1, 0 or 1.')
end

if a <= -1
    con = -1;
elseif a > 1
    con = 1;
else
    con = a;
end