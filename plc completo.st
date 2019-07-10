PROGRAM program0
  VAR
    temp AT %IW100 : UINT;
    LED_temp AT %QX100.0 : BOOL;
    button AT %IX100.1 : BOOL;
    button2 AT %QX0.0 : BOOL;
    buzzer AT %QX100.1 : BOOL;
    pot AT %IW101 : UINT;
    LED_pot AT %QW101 : UINT;
    select_input AT %QX0.1 : BOOL;
    scada_AI AT %QW0 : UINT;
  END_VAR
  VAR
    GT28_OUT : BOOL;
    SEL47_OUT : UINT;
  END_VAR

  LED_pot := pot;
  GT28_OUT := GT(temp, 2200);
  LED_temp := GT28_OUT;
  SEL47_OUT := SEL(select_input, pot, scada_AI);
  LED_pot := SEL47_OUT;
  buzzer := button OR button2;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
