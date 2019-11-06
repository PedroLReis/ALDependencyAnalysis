codeunit 99010 "ALDA Model Object"
{
    procedure CopyDownModule(ALDAModelObject: Record "ALDA Model Object")
    var
        ALDAElementLink: Record "ALDA Element Link";
    begin
        clear(ALDAElementLink);
        ALDAElementLink.SetCurrentKey("Source Object Type", "Source Object ID");
        ALDAElementLink.SetRange("Source Object Type", ALDAModelObject."Object Type");
        ALDAElementLink.SetRange("Source Object ID", ALDAModelObject."Object ID");
        ALDAElementLink.SetFilter("Source Module", '<>%1', ALDAModelObject.Module);
        ALDAElementLink.ModifyAll("Source Module", ALDAModelObject.Module, true);

        clear(ALDAElementLink);
        ALDAElementLink.SetCurrentKey("Target Object Type", "Target Object ID");
        ALDAElementLink.SetRange("Target Object Type", ALDAModelObject."Object Type");
        ALDAElementLink.SetRange("Target Object ID", ALDAModelObject."Object ID");
        ALDAElementLink.SetFilter("Target Module", '<>%1', ALDAModelObject.Module);
        ALDAElementLink.ModifyAll("Target Module", ALDAModelObject.Module, true);
    end;
}