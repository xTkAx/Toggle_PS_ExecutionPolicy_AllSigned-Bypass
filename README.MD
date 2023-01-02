# Toggle_PS_ExecutionPolicy_AllSigned_and_Bypass.ps1


### PURPOSE:
  
    A script to swap between default "AllSigned" execution policy and "Bypass"
        -"Bypass"    = used for quick script dev and better debugging in ISE.
        -"AllSigned" = used for the best safety (not safe to keep "Bypass" always on!)

### REQUIRES:

    **Run As Administrator**