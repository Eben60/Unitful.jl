using Unitful
include("public_listing.jl")
CN = CollectNames
cpb = CN.collect_pubnames
ipf = CN.isprefixed
idc = CN.isdocumented
udc = CN.unitsdict
nofu = CN.nameofunit
ps = CN.var_group_section
vg = CN.var_group
bvg = CN.both_var_groups
cpf = CN.create_pub_file

(; other_data, private_names, public_names) = 
    nt = 
    cpb();

(;uids, other_names, exported_names,) = other_data

(; underline_prepended_names, module_names, base_names, private_fns,) = private_names 

(; nodims_units, phys_consts, basic_dims, compound_dims, unit_names, 
    basic_units, compound_units, dim_abbreviations, quantities, unit_types,
    log_units, abstract_types, concrete_types,) = public_names

cpf(private_names, public_names)

;