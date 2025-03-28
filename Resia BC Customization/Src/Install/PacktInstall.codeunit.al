codeunit 50105 "Resia Install"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany();
    var
        CustomerCategory: Record "Customer Category";
        PacktSetup: Record "Resia Setup";
    begin
        if CustomerCategory.IsEmpty() then
            InsertDefaultCustomerCategory();
        if PacktSetup.IsEmpty() then
            InsertDefaultSetup();
    end;

    // Insert the GOLD, SILVER, BRONZE reward levels
    local procedure InsertDefaultCustomerCategory();
    begin
        InsertCustomerCategory('BRONZE', 'Bronze customers', true);
        InsertCustomerCategory('GOLD', 'Gold customers', false);
        InsertCustomerCategory('SILVER', 'Silver customers', false);
        InsertCustomerCategory('DIAMOND', 'Bronze customers', false);
    end;

    // Create and insert a Customer Category record
    local procedure InsertCustomerCategory(ID: Code[20]; Description: Text[50]; Default: Boolean);
    var
        CustomerCategory: Record "Customer Category";
    begin
        CustomerCategory.Init();
        CustomerCategory.Code := ID;
        CustomerCategory.Description := Description;
        CustomerCategory.Default := Default;
        CustomerCategory.Insert();
    end;

    local procedure InsertDefaultSetup()
    var
        PacktSetup: Record "Resia Setup";
    begin
        PacktSetup.Init();
        PacktSetup."Minimum Accepted Vendor Rate" := 6;
        PacktSetup."Gift Tolerance Qty" := 2;
        PacktSetup.Insert();
    end;
}