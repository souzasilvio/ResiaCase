tableextension 50101 "ItemLedgerEntryExt" extends "Item Ledger Entry"
{
    fields
    {
        //Field added during Sales Post
        field(50100; "Customer Category Code"; Code[20])
        {
            Caption = 'Customer Category';
            TableRelation = "Customer Category";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PKTK1; "Customer Category Code")
        {
        }
    }
}