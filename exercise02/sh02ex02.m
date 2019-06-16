%CV1 sh02ex02 by Marco Deuscher 977776 and Carolin Schindler 978616

dt = 0.25;
t0 = 0;
t = 0:dt:0.75;
s = [2 3 0 1];
N = length(s);

S = zeros(1,N);
for u=0:N-1
   for ts=0:N-1
      S(u+1) = S(u+1) + 1/sqrt(N) * s(ts+1)*exp(-i*2*pi*u*ts/N); 
   end
end

k=0:0.01:1;
sin_val = sin(2*pi*2/N.*k);
subplot 221;plot(k,sin_val);title("Sine-Wave with frequency f(u)=f(2)=2*pi*2/N");
xlabel("time");ylabel("Amplitude");

%Ex. c, inverse Fouriertransformation
is = zeros(1,N);
for u=0:N-1
    for ts=0:N-1
        is(u+1) = is(u+1) + 1/sqrt(N) * S(ts+1)*exp(i*2*pi*u*ts/N);
    end
end

subplot 222; stem(s);xlim([-1,5]);title("Original signal points");
xlabel("time");ylabel("s(t)");


subplot 223; stem(abs(S));xlim([-1,5]);title("Absolute of Fourier-Transform of orig. signal");
xlabel("frequency");ylabel("S(u)");

subplot 224; stem(is);xlim([-1,5]);title("Inverse-Fourier-Transform");
xlabel("time");ylabel("is(t)");


