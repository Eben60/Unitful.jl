using Unitful
include("public_listing.jl")
CN = CollectNames
cpb = CN.collect_pubnames
ipf = CN.isprefixed
idc = CN.isdocumented
udc = CN.unitsdict
nofu = CN.nameofunit
cpbb = CN.collect_pubnames_bak
(;
    uids, other_names, _internal_names, module_names, base_names, exported_names,
    nodims_units, phys_consts, basic_dims, compound_dims, unit_names, 
    basic_units, compound_units, dim_abbreviations, quantities, unittypes,
    log_units) = 
    nt = 
    cpb();

; 