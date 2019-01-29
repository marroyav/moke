           while((ADS1256_Scan() == 0));
                for (i = 0; i < ch_num; i++)
                {
                 adc[i] = ADS1256_GetAdc(i);
                 volt[i] = (adc[i] * 100) / 167;
                 iTemp = volt[i];
                 fprintf(fp,"Canal %d = (%ld.%03ld %03ld V) \t", (int)i, iTemp /1000000, (iTemp%1000000)/1000, iTemp%1000);
                 //printf("Canal %d = %6ld V \r\n",(int)i,(long)volt[i]);
                }
                fprintf(fp, "\n"); 