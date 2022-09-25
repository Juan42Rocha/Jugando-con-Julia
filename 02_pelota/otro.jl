function  main()
x0 = 1
y0 = 1
vy0 = 2.1
vxx = 1.1
nT = 10000
dt = 0.1

xf=zeros(nT)
yf=zeros(nT)

for k in 1:nT
  x = vxx * dt + x0
  y = vy0 * dt + y0

  if x>5 
    x = 5
    vxx = -vxx
 
  elseif x<0 
    x = 0
    vxx = -vxx
  
  elseif y>5 
    y = 5
    vy0 = -vy0
  
  elseif y<0 
    y = 0
    vy0 = -vy0
  end

  x0 = x
  y0 = y
  xf[k] = x
  yf[k] = y
end


return xf,yf 

end



