table 50102 "Vendor Quality"
{
    Caption = 'Vendor Quality';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(2; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            Editable = false;
        }
        field(3; "Vendor Activity Description"; Text[250])
        {
            Caption = 'Vendor Activity Description';
        }
        field(4; ScoreItemQuality; Integer)
        {
            Caption = 'Item Quality Score';
            MinValue = 1;
            MaxValue = 10;

            trigger OnValidate()
            begin
                UpdateVendorRate();
            end;
        }
        field(5; ScoreDelivery; Integer)
        {
            Caption = 'Delivery On Time Score';
            MinValue = 1;
            MaxValue = 10;

            trigger OnValidate()
            begin
                UpdateVendorRate();
            end;
        }
        field(6; ScorePackaging; Integer)
        {
            Caption = 'Packaging Score';
            MinValue = 1;
            MaxValue = 10;

            trigger OnValidate()
            begin
                UpdateVendorRate();
            end;
        }
        field(7; ScorePricing; Integer)
        {
            Caption = 'Pricing Score';
            MinValue = 1;
            MaxValue = 10;

            trigger OnValidate()
            begin
                UpdateVendorRate();
            end;
        }
        field(8; Rate; Decimal)
        {
            Caption = 'Vendor Rate';
        }
        field(10; UpdateDate; DateTime)
        {
            Caption = 'Update Date';
        }

        field(11; InvoicedYearN; Decimal)
        {
            Caption = 'Invoiced for current year (N)';
        }
        field(12; InvoicedYearN1; Decimal)
        {
            Caption = 'Invoiced for year N-1';
        }
        field(13; InvoicedYearN2; Decimal)
        {
            Caption = 'Invoiced for year N-2';
        }
        field(14; DueAmount; Decimal)
        {
            Caption = 'Due Amount';
            DataClassification = CustomerContent;
        }
        field(15; AmountNotDue; Decimal)
        {
            Caption = 'Amount to pay (not due)';
        }
    }

    keys
    {
        key(PK; "Vendor No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        UpdateDate := CurrentDateTime();
    end;

    trigger OnModify()
    begin
        UpdateDate := CurrentDateTime();
    end;

    local procedure UpdateVendorRate()
    var
        VendorQualityMgt: Codeunit "Vendor Quality Mgt";
    begin
        VendorQualityMgt.CalculateVendorRate(Rec);
    end;
}