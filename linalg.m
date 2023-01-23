bild

%a)
imshow(A,[0 255])
%%
%b)
[U,S,V] = svd(A);

plot(diag(S));

imshow(U*S*(V'), [0 255]);
%%
%c) 
R = A * 0;

for i=1:27
    R = R + U(:,i) * (S(i, i) * V(:, i)');
end

imshow(R, [0 255]);

 
%%
%e)

Antal_pixlar = size(A,1)*size(A,2);
r = size(A,1);

for p = 1 : r
    E = sqrt (sum (diag (S(p+1:r,p+1:r)^2))/Antal_pixlar);
    if E > 10
        continue
    else
        min_s = p;
        break
    end
end
disp(min_s)





