clear all, clc

p = 0; e = 0.015;

alpha = 0.01; beta = 0.3; %alpha and beta are user-defined soft-thresholds used in the score function 
 
if p == 1
    a = (e - alpha)/(beta - alpha); 
    b = -1; c = 1;
    if a <= b
        con = b
    elseif b < a && a <= c
        con = a
    elseif c < a
        con = c
    end
    disp('p = 1')

elseif p == 0
    a = 1 - (abs(e) - alpha)/(beta - alpha); 
    b = -1; c = 1;
    if a <= b
        con = b
    elseif b < a && a <= c
        con = a
    elseif c < a
        con = c
    end
    disp('p = 0')
    
elseif p == -1
    a = (-e - alpha)/(beta - alpha); 
    b = -1; c = 1;
    if a <= b
        con = b
    elseif b < a && a <= c
        con = a
    elseif c < a
        con = c
    end
    disp('p = -1')
    
else
    disply('Error, p should be either -1, 0 or 1.')
end