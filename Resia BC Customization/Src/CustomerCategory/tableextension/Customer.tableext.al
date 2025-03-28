tableextension 50102 "CustomerExt" extends Customer
{
    fields
    {
        field(50101; "Customer Category Code"; Code[20])
        {
            Caption = 'Customer Category Code';
            TableRelation = "Customer Category";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                CustomerCategory: Record "Customer Category";
                BlockedErr: Label 'This category is blocked.';
            begin
                if CustomerCategory.Get("Customer Category Code") then begin
                    if CustomerCategory.Blocked then
                        Error(BlockedErr);
                end;
            end;
        }
    }

    keys
    {
        key(CustomerCategory; "Customer Category Code")
        {
        }
    }
}