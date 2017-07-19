
alpha = 0.2; beta = 0.5;
%for p = 1
e1 = 0:0.01:0.31;
con1 = zeros(1,length(e1));
a1 = (e1 - alpha)/(beta - alpha); 
b = -1; c = 1;
for p1 = 1:length(e1)
    if a1(p1) <= b
        con1(p1) = b;
    elseif b < a1(p1) && a1(p1) <= c
        con1(p1) = a1(p1);
    elseif c < a1(p1)
        con1(p1) = c;
    end
end
figure(1), plot(e1,con1)

%for p = 0
e2 = 0.65:0.01:0.78;
con2 = zeros(1,length(e2));
a2 = 1 - (abs(e2) - alpha)/(beta - alpha); 
b = -1; c = 1;
for p2 = 1:length(e2)
    if a2(p2) <= b
        con2(p2) = b;
    elseif b < a2(p2) && a2(p2) <= c
        con2(p2) = a2(p2);
    elseif c < a2(p2)
        con2(p2) = c;
    end
end
figure(2), plot(e2,con2)


%for p = -1
e3 = 0.52:-0.01:0;
con3 = zeros(1,length(e3));
    a3 = (-e3 - alpha)/(beta - alpha); 
    b = -1; c = 1;
for p3 = 1:length(e3)
    if a3(p3) <= b
        con3(p3) = b;
    elseif b < a3(p3) && a3(p3) <= c
        con3(p3) = a3(p3);
    elseif c < a3(p3)
        con3(p3) = c;
    end
end
figure(3), plot(e3,con3)

    