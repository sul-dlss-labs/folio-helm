select module_requestor from (
  select module_requestor, row_number() over (order by depth, module_requestor) row_order from (
      select distinct depth, module_requestor from public.vmodules_hierarchy
      where ($SQL_WHERE) and max_depth = depth
    ) x
    ) y
    order by row_order