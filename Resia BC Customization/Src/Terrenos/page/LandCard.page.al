page 50121 "Land Card"
{
    Caption = 'Land Card';
    SourceTable = "Land";
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Name; Rec.Name)
                {
                }
            }


        }
    }

}