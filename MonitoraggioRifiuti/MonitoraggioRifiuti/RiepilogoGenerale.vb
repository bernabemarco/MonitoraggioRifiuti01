
Imports System.Threading

Public Class RiepilogoGenerale

    'Questa è la dichiarazione del Thread separato da quello principale
    Private newThread As Thread
    'Questa è la dichiarazione del Form SplashScreen
    Private Splash As SplashScreen
    'Questa è una variabile booleana che mi permette di chiudere lo SplashScreen al termine di tutte le operazioni
    Private Fine As Boolean



    Private Sub RiepilogoGenerale_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        'Creo una nuova istanza del Thread
        newThread = New Thread(AddressOf InitializeForm)
        'Faccio partire il Thread separato
        newThread.Start()
        'Scrivo nella label
        'Label1.Text = "Questo l'ho inizializzato durante la visualizzazione dello splash screen"
        'Attendo 3 secondi senza fare nulla giusdto per perder tempo

        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.RiepilogoGeneraleDT'. È possibile spostarla o rimuoverla se necessario.
        Me.RiepilogoGeneraleDTTableAdapter.FillRiepGenerale(Me.SicuraDataSet.RiepilogoGeneraleDT)
        For Each Row As DataGridViewRow In RiepilogoGeneraleDTDataGridView.Rows
            Row.Cells(1).Value = StatoImageList.Images(CInt(Row.Cells(10).Value))
        Next



        Thread.Sleep(10000)
        'Scrivo nel TextBox
        'TextBox1.Text = "e qui ho valorizzato la proprietà Text"
        'Attendo 3 secondi senza fare nulla giusdto per perder tempo
        Thread.Sleep(3000)
        'Imposto a True la variabile booleana per chiudere lo splashscreen
        Fine = True

    End Sub

    Private Sub InitializeForm()
        ' Qui ho giocato un pò con delle variabili integer per permettere una stupidissima animazione della Label
        'senza bloccare l'esecuzione del Thread in modo da lasciare scorrere l'animazione della progress bar.
        Dim a As Integer
        Dim b As Integer
        Splash = New SplashScreen
        Splash.Show()
        Splash.Label1.Text = "Caricamento in corso"
        Do
            If a > 10000 Then
                Splash.Label1.Text += "."
                a = 0
                b += 1
            End If
            a += 1
            If b > 10 Then
                Splash.Label1.Text = "Caricamento in corso"
                b = 0
            End If
            'Questo permette l'aggiornamento della parte grafica dello splashscreen
            Application.DoEvents()
        Loop Until Fine
        Splash.Close()
    End Sub


    Private Sub ApplicaFiltro_Click(sender As Object, e As EventArgs) Handles ApplicaFiltro.Click
        Dim strSearc As String

        strSearc = Me.TextBoxFiltro.Text
        Me.RiepilogoGeneraleDTBindingSource.Filter = "CLIENTE Like '%" & strSearc & "%'"

    End Sub

    Private Sub RimuoviFiltro_Click(sender As Object, e As EventArgs) Handles RimuoviFiltro.Click
        Me.RiepilogoGeneraleDTBindingSource.Filter = ""
    End Sub


End Class
