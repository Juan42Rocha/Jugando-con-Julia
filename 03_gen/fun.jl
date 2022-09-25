

 evalfun(x,y) = @. x^2 + y^2


#= ===================

para generar una pob inicial es necesario
using Random
pob = bitrand(size_poblacion, size_gen)

=# 
function undecoding(pob,interval)
  n = size(pob,2)

  pw = 2.0 .^(-collect(1:n))
  val =  (pob * pw)*(interval[2] - interval[1]) .+ interval[1]
  
  return val

end

#=
Nueva generacion 
newGen(problacion,proba. mutacion)
=#
function newGen(pob,probmut)

  t1 = size(pob)
  t2 = zeros(1,t1[2])
  npob = pob 
  idx = rand((collect(1:t1[2]-1)),Int64(t1[1]/2) )  # idex de corte

  idxpad = sortperm(rand(Int64(t1[1]/2 ) ))     # permutacion para formar parejas

  kcont = 1
  for k in Int64(t1[1]/2)+1:2:t1[1]-1
    vc = idx[kcont]
    kidx1 = idxpad[kcont]
    kidx2 = idxpad[kcont+1]

    npob[k,1:vc] = npob[kidx1,1:vc] 
    npob[k,vc+1:end] = npob[kidx2,vc+1:end]
    
    if probmut > rand(1)[1]
      idxm = rand(collect(1:t1[2]),1)[1]
      npob[k,idxm] = 1 - npob[k,idxm]
    end

 
    npob[k+1,1:vc] = npob[kidx2,1:vc] 
    npob[k+1,vc+1:end] = npob[kidx1,vc+1:end] 

    if probmut >  rand(1)[1]
      idxm = rand(collect(1:t1[2]),1)[1]
      npob[k+1,idxm] = 1 - npob[k+1,idxm]
    end

    kcont = kcont+2
  end
  
  return npob
end
