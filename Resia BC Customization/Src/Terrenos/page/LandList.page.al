page 50120 "Land List"
{
    Caption = 'Land List';
    SourceTable = "Land";
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    CardPageId = "Land Card";
    AdditionalSearchTerms = 'land';
    AboutTitle = 'About Land';
    AboutText = 'Here you can define the **lands**';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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