CREATE PROCEDURE MoveBook 
    @FromBookshopId INT,
    @ToBookshopId INT,
    @ISBN NVARCHAR(13),
    @Amount INT = 1

AS 
BEGIN TRY
    BEGIN TRANSACTION
        UPDATE LagerSaldo
        SET [Number of books] = [Number of books] - @Amount
        WHERE BookshopId = @FromBookshopId AND ISBN = @ISBN

        IF @@ROWCOUNT = 0
        THROW 50000, 'The book you want to transfer is not found in the bookshop.', 1;

        UPDATE LagerSaldo
        SET [Number of books] = [Number of books] + @Amount
        WHERE BookshopId = @ToBookshopId AND ISBN = @ISBN

        -- if the book does not exist in to-bookshop, then the row will be inserted
        IF @@ROWCOUNT = 0 
        BEGIN 
            INSERT INTO LagerSaldo (BookshopId, ISBN, [Number of books])
            VALUES (@ToBookshopId, @ISBN, @Amount)
        END 

    COMMIT TRANSACTION
    Print 'Transaction of the book completed successfully.'
END TRY 
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION
        Print 'Unsuccessful transaction.'
END CATCH

EXEC MoveBook 
    @FromBookshopId = 1,
    @ToBookshopId = 2,
    @ISBN = '9789358480313', 
    @Amount = 2;

SELECT * FROM LagerSaldo WHERE ISBN = '9789358480313'; 