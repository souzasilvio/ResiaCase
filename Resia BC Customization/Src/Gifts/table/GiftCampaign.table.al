table 50105 "Gift Campaign"
{
    Caption = 'Gift Campaign';
    DataClassification = CustomerContent;
    DrillDownPageId = "Gift Campaign List";
    LookupPageId = "Gift Campaign List";

    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            Caption = 'Customer Category Code';
            TableRelation = "Customer Category";

            trigger OnValidate()
            var
                CustomerCategory: Record "Customer Category";
                NoGiftsErr: Label 'This category is not enabled for Gift Campaigns.';
                BlockedErr: Label 'This category is blocked.';
            begin
                CustomerCategory.Get(CustomerCategoryCode);
                if CustomerCategory.Blocked then
                    Error(BlockedErr);
                if not CustomerCategory.FreeGiftsAvailable then
                    Error(NoGiftsErr);
            end;
        }
        field(2; ItemNo; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3; StartingDate; Date)
        {
            Caption = 'Starting Date';
        }
        field(4; EndingDate; Date)
        {
            Caption = 'Ending Date';
        }
        field(5; MinimumOrderQuantity; Decimal)
        {
            Caption = 'Minimum Order Quantity';
        }
        field(6; GiftQuantity; Decimal)
        {
            Caption = 'Free Gift Quantity';
        }
        field(7; Inactive; Boolean)
        {
            Caption = 'Inactive';
        }
    }

    keys
    {
        key(PK; CustomerCategoryCode, ItemNo, StartingDate, EndingDate)
        {
            Clustered = true;
        }
    }
}