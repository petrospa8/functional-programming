open St_tree;;
open Bin_tree;;

let rec bin_tree_of_st_tree t =
	try let a,b = St_tree.branches t in
	 Bin_tree.comp (St_tree.root t) (bin_tree_of_st_tree a, bin_tree_of_st_tree b)
	with St_tree.No_branches -> Bin_tree.comp (St_tree.root t) (Empty, Empty);;


let rec st_tree_of_bin_tree t = match (Bin_tree.branches t) with
	Empty, Empty -> St_tree.single (Bin_tree.root t)
	| Empty, _|_, Empty -> raise (Invalid_argument "St_tree_of_bin_tree")
	| a,b -> St_tree.comp (Bin_tree.root t) (st_tree_of_bin_tree a, st_tree_of_bin_tree b);; 
