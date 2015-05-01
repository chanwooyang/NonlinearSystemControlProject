function dqdt = eomsolver237(t,yy,m,c,k,r2,r3,r4,r5)
    
    x = yy(1); y = yy(2); xd = yy(3); yd = yy(4);
    
    r1 = [x y]';
    
    if t < 1.0
        L20 = 5;         % initial length of cable 1 [m]
        L30 = 5;         % initial length of cable 2 [m]
        L40 = 5;         % initial length of cable 3 [m]
        L50 = 5;         % initial length of cable 4 [m]
    elseif t >= 1.0 && t < 2.0
        L20 = 5;
        L30 = 4;
        L40 = 2;
        L50 = 1;
    elseif t >= 2.0 && t < 3.0
        L20 = 4;
        L30 = 1;
        L40 = 2;
        L50 = 3;
    elseif t >= 3.0 && t < 4.0
        L20 = 1;
        L30 = 5;
        L40 = 1;
        L50 = 1;
    else
        L20 = 5;
        L30 = 5;
        L40 = 5;
        L50 = 5;
    end
    
    dqdt = zeros(4,1);
    Fs = k*(signChecker(norm(r2-r1)-L20))*((r2-r1)/norm(r2-r1))+...
         k*(signChecker(norm(r3-r1)-L30))*((r3-r1)/norm(r3-r1))+...
         k*(signChecker(norm(r4-r1)-L40))*((r4-r1)/norm(r4-r1))+...
         k*(signChecker(norm(r5-r1)-L50))*((r5-r1)/norm(r5-r1));
    Fd = -c*[xd yd]';
     
    dqdt(1:2) = [xd,yd]';
    dqdt(3:4) = [m*(Fs'+Fd')*[1 0]',m*(Fs'+Fd')*[0 1]']';
    

end