# Finding-the-Neighbours-of-a-Given-Vertex

1- Given a graph as an input, your task is to find out the neighbours of a given vertex and then output its degree. Degree of a vertex is the total number of vertices that have direct edges to the given vertex. Please write a Scheme procedure find-neighbours that has the following prototype:  

(find-neighbours input-graph vertex-id)  

Example:  
(find-neighbours ‘((v1 v2) (v2 v3) (v2 v7) (v7 v8) (v4 v7) (v5 v4) (v6)) v4)  
(v5 v7)  

2- A  hypergraph  is  a  generalization  of  a  graph  in  which  an  edge  can  connect  any  number  of  vertices. Please write a higher order version of procedure find-neighbours that works with an input hypergraph as well.  

(find-neighbours ‘((v1 v2) (v2 v3) (v2 v7) (v3 v4 v6) (v7 v8) (v4 v7) (v5 v4)) v4)  
(v3 v5 v6 v7) 
