clear
clc
close all

run StateSpace.m

T=0.035;

Lx = diag(Lobs);
B1 = B2(1,:);%[ 0.0, -0.2396, 0.0, 0.2396 ];
B2_x = B2(2,:);%[ 0.2396, 0.0, -0.2396, 0.0 ];
B3 = B2(3,:);%[ 0.0377, -0.0377, 0.0377, -0.0377 ];
F1 = F(1,:);%[-0.6, -1615, -5182.5, 0, -100.7, -321.3 ];
F2 = F(2,:);%[ 1611.5, -1, 5182.4, 100.6, 0, 321.3 ];
F3 = F(3,:);%[ 25.5, 1646, - 5192.5, 0.8, 101.6, -321.6 ];
F4 = F(4,:);%[ -1636.4, -30, 5192.5, -101.4, -0.9, 321.6 ];
Fint1 = FI(1,:);%[ -7, - 8609, -27804 ];
Fint2 = FI(2,:);%[ 8583, -12, 27806 ];
Fint3 = FI(3,:);%[ 206, 8871, -27888 ];
Fint4 = FI(4,:);%[ -8782, -249, 27886 ];
sim('state_feedback.slx')
u_k1 	= [0.0, 0.0, 0.0, 0.0];
y_k 	= [0.0, 0.0, 0.0];
r_k 	= [0.0, 0.0, 0.0];
x2_k1 	= [0.0, 0.0, 0.0];
xint_k1 = [ 0.0, 0.0, 0.0 ];
e_k1 = [ 0.0, 0.0, 0.0 ];
o_k1 = [ 0.0, 0.0, 0.0 ];
oint_k1 = [ 0.0, 0.0, 0.0 ];
u_z = 0;
pos = [ 0.0, 0.0, 0.0];
pos_ref = [ 0.0, 0.0, 0.0];
vel = [ 0.0, 0.0, 0.0];

for k=1:1:5000
	xint_k = [ 0.0, 0.0, 0.0 ];
	x2_k = [ 0.0, 0.0, 0.0 ];
	o_k = [ 0.0, 0.0, 0.0 ];
	oint_k = [ 0.0, 0.0, 0.0 ];
	e_k = [ 0.0, 0.0, 0.0 ];

	for i=1:1:3
			e_k(i) = y_k(i) - r_k(i);
			xint_k(i) = T / 2 * (e_k(i) + e_k1(i)) + xint_k1(i);

			switch i			
                case 1,
                    o_k(i) = Lx(i) * x2_k1(i) + B1(1) * u_k1(1) + B1(2) * u_k1(2) + B1(3) * u_k1(3) + B1(4) * u_k1(4) ;
                case 2,
                    o_k(i) = Lx(i) * x2_k1(i) + B2_x(1) * u_k1(1) + B2_x(2) * u_k1(2) + B2_x(3) * u_k1(3) + B2_x(4) * u_k1(4) ;
                case 3,
                    o_k(i) = Lx(i) * x2_k1(i) + B3(1) * u_k1(1) + B3(2) * u_k1(2) + B3(3) * u_k1(3) + B3(4) * u_k1(4) ;
            end
                oint_k(i) = T / 2 * (o_k(i) + o_k1(i)) + oint_k1(i);
                x2_k(i) = oint_k(i) - Lx(i) * y_k(i);
    end
    Int(:,k)=xint_k'; 
    O(:,k)=x2_k';
    
    for j=1:1:4
		switch j
		case 1,
            %u_k1(j) = Fint1(1) * xint_k(1) + Fint1(2) * xint_k(2) + Fint1(3) * xint_k(3);			
            u_k1(j) = F1(1) * y_k(1) + F1(2) * y_k(2) + F1(3) * y_k(3) + F1(4) * x2_k(1) + F1(5) * x2_k(2) + F1(6) * x2_k(3) + Fint1(1) * xint_k(1) + Fint1(2) * xint_k(2) + Fint1(3) * xint_k(3);
		case 2,
            %u_k1(j) = Fint2(1) * xint_k(1) + Fint2(2) * xint_k(2) + Fint2(3) * xint_k(3);
            u_k1(j) = F2(1) * y_k(1) + F2(2) * y_k(2) + F2(3) * y_k(3) + F2(4) * x2_k(1) + F2(5) * x2_k(2) + F2(6) * x2_k(3) + Fint2(1) * xint_k(1) + Fint2(2) * xint_k(2) + Fint2(3) * xint_k(3);
		case 3,
            %u_k1(j) = Fint3(1) * xint_k(1) + Fint3(2) * xint_k(2) + Fint3(3) * xint_k(3);
            u_k1(j) = F3(1) * y_k(1) + F3(2) * y_k(2) + F3(3) * y_k(3) + F3(4) * x2_k(1) + F3(5) * x2_k(2) + F3(6) * x2_k(3) + Fint3(1) * xint_k(1) + Fint3(2) * xint_k(2) + Fint3(3) * xint_k(3);
		case 4,
            %u_k1(j) = Fint4(1) * xint_k(1) + Fint4(2) * xint_k(2) + Fint4(3) * xint_k(3);
            u_k1(j) = F4(1) * y_k(1) + F4(2) * y_k(2) + F4(3) * y_k(3) + F4(4) * x2_k(1) + F4(5) * x2_k(2) + F4(6) * x2_k(3) + Fint4(1) * xint_k(1) + Fint4(2) * xint_k(2) + Fint4(3) * xint_k(3);
        end
    end

    e_k1(1) = e_k(1);
	e_k1(2) = e_k(2);
	e_k1(3) = e_k(3);
	xint_k1(1) = xint_k(1);
	xint_k1(2) = xint_k(2);
	xint_k1(3) = xint_k(3);
	o_k1(1) = o_k(1);
	o_k1(2) = o_k(2);
   	o_k1(3) = o_k(3);
	oint_k1(1) = oint_k(1);
	oint_k1(2) = oint_k(2);
	oint_k1(3) = oint_k(3);
	x2_k1(1) = x2_k(1);
	x2_k1(2) = x2_k(2);
	x2_k1(3) = x2_k(3);
    
    U(:,k)=u_k1'; 
    
end