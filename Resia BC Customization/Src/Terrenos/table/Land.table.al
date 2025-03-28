
table 50120 "Land"
{
    Caption = 'land';
    DrillDownPageId = "Land List";
    LookupPageId = "Land List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}

