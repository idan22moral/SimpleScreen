   M S B A M L   `   `   `  ����R  NSimpleScreen (Receiver), Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:SimpleScreen__Receiver_SimpleScreen__Receiver_  5   	   (    "SimpleScreen__Receiver_.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:SimpleScreen__Receiver_     5   	     � Title$  SimpleScreen (Receiver)��5   	   $	��350��6)   $	��550��66    � 
ResizeMode$ CanMinimize=�6B    � WindowStyle$
 None=�6[    � 	Resources 5	         BlueToGreenGradient �� EndPoint � MappingMode �� 
StartPoint � Color � Offset  ButtonBrush  ButtonHoverBrush  TextBoxStyle	 �� 
TargetType
 �� Property �� Value �� Triggers P� Property P� Value  ButtonStyle  ButtonStyleNoHighlighting �� 
TargetType'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState��%U  &	        &	 �     &	 �     &	 �     &	 �    &	 `    �� 5
   
   $ 0.5,1&�6:   $ RelativeToBoundingBox=�6K   $ 0.5,0&�6o   .��5      � $ 	#FF005DFF��6   � 5      $ 	#FF00FF97��6   $ 1Q�6-   5      ��5   
   #36393F��5      ��5   
   #2F3136��5      �� 5   
   "	 ��6%   .�5      �� 
 � ��$ 0q�60   6<    5      P� 5       �@J�IsMouseOver . . �5      �� 
 � ��$ 0q�68   5      5      �� 5   
   "	 ��6$   .�5      �� 
 � �� �	#FF2F31366?    5      P� 5        �@J�IsMouseOver . . �5!      �� 
 � ��# �  63   6`   5"      5$      �� 5&   
   "	 ��62   .�5'      �� 
 � �� 5(      �� 5)      " ��6&   .R�5*      � #��z��6    5+        5,   "   CommonStates��. 5-   &     
Normal��62   5/   #   51      52      54      �� 55      
 � ��
 �   �6<    56      P� 57       �@J�IsMouseOver . . �58      �� 
 �@�Cursor$
 Hand��6/   6>   �� 59      
 �@J�Opacity$	 0.2Q�60   6>   5:      5<      5=      .��5>      � ���	#FF1E2124.+�5?   
   �� -   5         ��Name$ WaitText��5?      $��Waiting for Stream��6"   $��100,120q�6?   $��Product Sans)�6P   $��36(�6j   
�������$��Center=�6�   $��Center=�6�   �� 5@   
   -   5         ��Name$ DraggableRectangle��5@      $��37��60   $	��Top=�6<   $��0,0,67.735,0q�6}   ���	#001E21246�   �� 5B   
   -   5         ��Name$ 
ExitButton��5B      #���  6%   $�� ��6Y   $��Right=�6d   $��	0,10,10,0q�6�   $	��Top=�6�   $��20��6�   $��20��6�   ��6�   Z� ��6�   Z� ��5C      �� 5D       �� ImageSource$ Images/ExitImage.png��6   5F      �� 5G   
   -   5        $ MinimizeButton��5G      #���  6)   $�� ��6]   $��Right=�6h   $��	0,10,35,0q�6�   $	��Top=�6�   $��20��6�   $��20��6�   ��6�   Z� ��6�   Z� ��5H      �� 5I      $ Images/MinimizeImage.png��6   5K      �� 5L   
   -   5         ��Name$ StreamImage��5L      $��10,42,10,10q�6%   5N      5O      