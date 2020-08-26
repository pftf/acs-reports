echo -off
          for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F
            if exist FS%i:\SCT_RUN then
              FS%i:
              cd SCT_RUN
              echo Press any key to stop the EFI SCT running
              stallforkey.efi 5
              if %lasterror% == 0 then
                goto Done
              endif

              if exist FS%i:\SCT_RUN\.passive.mode then
                if exist FS%i:\SCT_RUN\.verbose.mode then
                  Sct -c -p mnp -v
                else
                  Sct -c -p mnp
                endif
              else
                if exist FS%i:\SCT_RUN\.verbose.mode then
                  Sct -c -v
                else
                  Sct -c
                endif
              endif
              goto Done
            endif
          endfor
          :Done
