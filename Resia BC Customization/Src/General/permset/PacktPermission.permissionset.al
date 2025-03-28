permissionset 50100 "Resia Permission"
{
    Caption = 'Resia Permissions';
    Assignable = true;
    Permissions = tabledata "Customer Category" = RIMD,
        tabledata "Land" = RIMD,
        tabledata "Gift Campaign" = RIMD,
        tabledata "Resia Setup" = RIMD,
        tabledata "Vendor Quality" = RIMD,
        table "Customer Category" = X,
        table "Land" = X,
        table "Gift Campaign" = X,
        table "Resia Setup" = X,
        table "Vendor Quality" = X,
        //report "Item Ledger Entry Analysis" = X,
        codeunit "Customer Category Mgt" = X,
        codeunit "Gift Management" = X,
        codeunit "Vendor Quality Mgt" = X,
        page "Customer Category Card" = X,
        page "Land Card" = X,
        page "Land List" = X,
        page "Customer Category List" = X,
        page "Gift Campaign List" = X,
        page "Resia Setup" = X,
        page "Vendor Quality Card" = X;
}

permissionset 50101 "Sales Agent"
{
    Assignable = true;
    Caption = 'Sales Agent Base';

    Permissions =
        tabledata Customer = RIMD,
        tabledata "Payment Terms" = RMD,
        tabledata Currency = RM,
        tabledata "Sales Header" = RIM,
        tabledata "Sales Line" = RIMD;
}

permissionset 50102 "Sales Agent Adv"
{
    Assignable = true;
    Caption = 'Advanced Sales Agent';
    IncludedPermissionSets = "Sales Agent", "D365 CUSTOMER, EDIT", "D365 VENDOR, EDIT";

    Permissions =
        tabledata "Purchase Header" = RIM,
        tabledata "Purchase Line" = RIMD,
        codeunit AccSchedManagement = X;
}

permissionset 50103 "Sales Agent Jnr"
{
    Assignable = true;
    Caption = 'Junior Sales Agent';
    IncludedPermissionSets = "Sales Agent Adv";
    ExcludedPermissionSets = "D365 VENDOR, EDIT";
}