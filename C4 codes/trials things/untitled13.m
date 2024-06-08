act4=circshift(act4,[0,v4]);
    act5=circshift(act5,[0,v5]);
    act6=circshift(act6,[0,v6]);
    act7=circshift(act7,[0,v7]);
    act8=circshift(act8,[0,v8]);
    act9=circshift(act9,[0,v9]);
    act10=circshift(act10,[0,v10]);
    act11=circshift(act11,[0,v11]);
    act12=circshift(act12,[0,v12]);
    act13=circshift(act13,[0,v13]);
    act14=circshift(act14,[0,v14]);
    act15=circshift(act15,[0,v15]);
    act16=circshift(act16,[0,v16]);
    act17=circshift(act17,[0,v17]);
    act18=circshift(act18,[0,v18]);
    act19=circshift(act19,[0,v19]);
    act20=circshift(act20,[0,v20]);
    act21=circshift(act21,[0,v21]);
    act22=circshift(act22,[0,v22]);
    act23=circshift(act23,[0,v23]);
    act24=circshift(act24,[0,v24]);
    act25=circshift(act25,[0,v25]);
    act26=circshift(act26,[0,v26]);
    act27=circshift(act27,[0,v27]);
    act28=circshift(act28,[0,v28]);
    act29=circshift(act29,[0,v29]);
    act30=circshift(act30,[0,v30]);
    act31=circshift(act31,[0,v31]);
    act32=circshift(act32,[0,v32]);
    act33=circshift(act33,[0,v33]);
    act34=circshift(act34,[0,v34]);
    act35=circshift(act35,[0,v35]);
    act36=circshift(act36,[0,v36]);
    act37=circshift(act37,[0,v37]);
    act38=circshift(act38,[0,v38]);
    act39=circshift(act39,[0,v39]);
    act40=circshift(act40,[0,v40]);
    act41=circshift(act41,[0,v41]);
    act42=circshift(act42,[0,v42]);
    act43=circshift(act43,[0,v43]);
    act44=circshift(act44,[0,v44]);
    act45=circshift(act45,[0,v45]);
    act46=circshift(act46,[0,v46]);
    act47=circshift(act47,[0,v47]);
    act48=circshift(act48,[0,v48]);
    act49=circshift(act49,[0,v49]);
    act50=circshift(act50,[0,v50]);

    life4=circshift(life4,[0,v4]);
    life5=circshift(life5,[0,v5]);
    life6=circshift(life6,[0,v6]);
    life7=circshift(life7,[0,v7]);
    life8=circshift(life8,[0,v8]);
    life9=circshift(life9,[0,v9]);
    life10=circshift(life10,[0,v10]);
    life11=circshift(life11,[0,v11]);
    life12=circshift(life12,[0,v12]);
    life13=circshift(life13,[0,v13]);
    life14=circshift(life14,[0,v14]);
    life15=circshift(life15,[0,v15]);
    life16=circshift(life16,[0,v16]);
    life17=circshift(life17,[0,v17]);
    life18=circshift(life18,[0,v18]);
    life19=circshift(life19,[0,v19]);
    life20=circshift(life20,[0,v20]);
    life21=circshift(life21,[0,v21]);
    life22=circshift(life22,[0,v22]);
    life23=circshift(life23,[0,v23]);
    life24=circshift(life24,[0,v24]);
    life25=circshift(life25,[0,v25]);
    life26=circshift(life26,[0,v26]);
    life27=circshift(life27,[0,v27]);
    life28=circshift(life28,[0,v28]);
    life29=circshift(life29,[0,v29]);
    life30=circshift(life30,[0,v30]);
    life31=circshift(life31,[0,v31]);
    life32=circshift(life32,[0,v32]);
    life33=circshift(life33,[0,v33]);
    life34=circshift(life34,[0,v34]);
    life35=circshift(life35,[0,v35]);
    life36=circshift(life36,[0,v36]);
    life37=circshift(life37,[0,v37]);
    life38=circshift(life38,[0,v38]);
    life39=circshift(life39,[0,v39]);
    life40=circshift(life40,[0,v40]);
    life41=circshift(life41,[0,v41]);
    life42=circshift(life42,[0,v42]);
    life43=circshift(life43,[0,v43]);
    life44=circshift(life44,[0,v44]);
    life45=circshift(life45,[0,v45]);
    life46=circshift(life46,[0,v46]);
    life47=circshift(life47,[0,v47]);
    life48=circshift(life48,[0,v48]);
    life49=circshift(life49,[0,v49]);
    life50=circshift(life50,[0,v50]);





    randomNUM1 = round(1+rand(1,1)*(act-1));
    index_now1 = active_position(randomNUM1);
    theta_now1 = sand_pile(1,index_now1);
    radius_now1 = sand_pile(2,index_now1);
    active_or_not1 = rand;
    if active_or_not1 <= p_sp
        sand_pile(3,index_now1) = sand_pile(3,index_now1) + add_number;
        active_matrix(3,index_now1) = active_matrix(3,index_now1) + regeneration_time_1;
        life_time(3,index_now1) = life_time(3,index_now1) + lifetime;
    end




    check_point_here = mod(timesteps,3);
    if check_point_here == 0
       sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50]-1;
       sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50]-1;
       sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50]-1;
    else 
        sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50];
        sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50];
        sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50];
    end


      [life_position_8] = find(life_time(3,:) == 8);
    for k=1:length(life_position_8)
       sand_pile(2,life_position_8(k)) = life_time(2,life_position_8(k)) - 1; 
    end
    [life_position_5] = find(life_time(3,:) == 5);
    for k=1:length(life_position_5)
       sand_pile(2,life_position_5(k)) = life_time(2,life_position_5(k)) - 1; 
    end
    [life_position_2] = find(life_time(3,:) == 2);
    for k=1:length(life_position_2)
       sand_pile(2,life_position_2(k)) = life_time(2,life_position_2(k)) - 1; 
    end