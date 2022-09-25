
using Random
function main()

include("fun.jl" )

Ngen = 100
Sgeno = 20000

# Genera poblacion inicial
pob=bitrand(4*50,Sgeno)

x=zeros(Ngen)
y=zeros(Ngen)
z=zeros(Ngen)

for k in 1:Ngen
  # decodifica poblacion
  valpobx = undecoding(pob[:,1:Int64(Sgeno/2)],[-1 1])
  valpoby = undecoding(pob[:,Int64(Sgeno/2)+1:end],[-1 1])
  
  # Evalua y ordena poblacion
  vals = evalfun(valpobx,valpoby)
  nidx = sortperm(vals)

  sortpob = pob[nidx,:]

  # nueva generacion 
  pob = newGen(sortpob,0.05)

  x[k] = valpobx[nidx[end]]
  y[k] = valpoby[nidx[end]]
  z[k] = vals[nidx[end]]

 end
 
 return x,y,z
end
